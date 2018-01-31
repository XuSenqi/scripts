var util = require("util");

var body = {
    RetCode: 0,
    Action: 'DescribeUHostRecycleResponse',
    UHostSet:
        [ { OsName: 'CentOS 6.5 64位',
            Remark: '',
            Tag: 'Default',
            UHostType: 'Normal',
            CPU: 1,
            State: 'Install Fail',
            BasicImageId: 'uimage-5v2tlw',
            CreateTime: 1513245977,
            Zone: 'pre',
            SubnetType: 'Default',
            ImageId: '1c2ad652-37aa-4d03-afff-7ed17362708e',
            ToBeDestroyed: 'Yes',
            TimemachineFeature: 'no',
            Destroyed: '',
            NetCapability: 'Normal',
            DiskSet:
                [ { Type: 'Boot',
                    DiskId: '1c2ad652-37aa-4d03-afff-7ed17362708e',
                    Drive: '/dev/vda',
                    Size: 20 } ]
        }]
};

console.log( util.inspect( body ) );  //默认，depth = 2 
console.log( "///////////////////" );  //默认，depth = 2 
console.log( util.inspect( body, { depth: 2 } ) );
console.log( "///////////////////" );  
console.log( util.inspect( body, { depth: 10 } ) );
console.log( "///////////////////" );  
console.log( util.inspect( body, { showHidden: true, depth: 10 } ) );
