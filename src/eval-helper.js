var vm = require('vm');

process.on(
    'message',
    function(msg) {

        var evalable = msg.evalable,
            result;

        try {
            result = vm.runInNewContext(evalable);
        } catch(e) {
            result = e.message;
        }

        process.send({result: result});
        process.exit(0);
    }
);
