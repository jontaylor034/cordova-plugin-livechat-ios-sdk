var exec = require('cordova/exec');

module.exports = {
	
	openLiveChat: function(callback){
		exec(callback, function(err){
            console.log('error presenting livechat');
            }, "LiveChatPlugin", "livechat");
        return true;
    },

    initLiveChat: function (license, group, account, name, callback) {
        exec(callback, function (err){
            console.log('error initializing livechat');
        }, "LiveChatPlugin", "init", [license, group, account, name]);
        return true;    
    }
};
