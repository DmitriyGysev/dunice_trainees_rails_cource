App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden');
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<div class='message'><span class='message-user'>" + data.user + "</span>:" + data.message + "</div>";
    }
});