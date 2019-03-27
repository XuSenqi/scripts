#!/bin/sh

# 参数：
# 1 zk_cluster: 机房zk集群
# 2 dest_ip: 待部署机器的ip
# 3 setid
# 4 instance

# ./deploy_scheduler.sh 192.168.153.88:2181,192.168.153.89:2181,192.168.153.90:2181 192.168.153.51 set9 0

# steps:
# 1 clone
# 2 目标端创建目录
# 3 upload
# 4 重启代码或者kill后start

if [[ $# -ne 4 ]];then
	    echo "eg. $0 \$zk_cluster \$dest_ip \$set_no \$instance" >&2
	        exit 1
	fi

	zk_cluster=$1 
	dest_ip=$2    
	set_no=$3 
	instance=$4 
	src_file="uhost_server"
	dst_dir="/data/uframework"
	server_name="uhost-scheduler"

	bak_date=`date +%Y-%m-%d`
	bak_time=`date +%H:%M`
	cur_dir=`pwd`
	date_dir=$cur_dir/$bak_date

	project="uhost-go"
	project_dir="$date_dir"/"$project"
	project_time_dir="$date_dir"/"$project""_""$bak_time"
	echo $project_dir
	echo $project_time_dir

	if [ ! -d $date_dir ]; then
		  mkdir $date_dir
	  fi

  do_git_clone( ){
    cd $date_dir
      repo="git@gitlab.ucloudadmin.com:uhost/uhost-go.git"

        git clone $repo
	  if [[ $? -ne 0 ]];then
		        echo "git clone error:!!! git clone $repo"
			      exit 1
			        fi

				  mv $project_dir $project_time_dir
			  }

			  make_dst_dir( ){
			      echo "mkdir $dst_dir"
			          ssh root@$dest_ip "if [ ! -d "$dst_dir" ]; then
				          mkdir $dst_dir
					      fi"   
					          if [[ $? -ne 0 ]];then
							          echo "error mkdir $dst_dir"
								          exit 1
									      fi

									          echo "rm -f $dst_dir/$src_file"
										      ssh root@$dest_ip "if [ -f $dst_dir/$src_file ]; then
										              rm -f $dst_dir/$src_file
											          fi"   
												      if [[ $? -ne 0 ]];then
													              echo "error rm -f $dst_dir/$src_file"
														              exit 1
															          fi
															  }

														  do_uplode_code( ){
														      echo "scp $project_time_dir/$src_file root@$dest_ip:$dst_dir"
														          scp $project_time_dir/$src_file root@$dest_ip:$dst_dir

															      if [[ $? -ne 0 ]];then
																              echo "scp error:!!! scp $project_time_dir/$src_file root@$dest_ip:$dst_dir"
																	              exit 1
																		          fi
																		  }

																		  # 1 有其他服务存在的情况 ：kill掉 
																		  # 2 没有服务 直接拉起
																		  start_server() {
																			      ssh root@$dest_ip "
																			              echo "pm2 stop $server_name"
																				              pm2 stop $server_name
																					              echo "pm2 delete $server_name"
																						              pm2 delete $server_name 

																							              echo "pm2 start $dst_dir/$src_file --force --name $server_name -- -z $zk_cluster -a $server_name -s $set_no -i $instance"
																								              pm2 start $dst_dir/$src_file --force --name $server_name -- -z $zk_cluster -a $server_name -s $set_no -i $instance
																									              
																									              if [[ $? -ne 0 ]];then
																											                  echo "pm2 start failed!!!"
																													              exit 1
																														              fi
																															          "
																															  }

																															  check_server() {
																																      ssh root@$dest_ip "
																																          sleep 3
																																	      pm2 l | grep $server_name
																																	          sleep 3
																																		      pm2 l | grep $server_name
																																		          "
																																		  }

																																		  #clone 代码
																																	  do_git_clone

																																	  make_dst_dir

																																	  #拷贝代码
																																  do_uplode_code

																																  start_server

																																  check_server

