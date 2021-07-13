class MessagesController < ApplicationController
    def index
        # puts "Username: #{}"
        # @user = User.first
        @messages = Message.joins(:user)
    end
    def create
        msg = Message.new(params.require(:msg).permit(:message, :user_id))
        if(msg.save)
            flash[:notice] = ["Lorem Ipsum"]
        else
            flash[:notice] = msg.errors.full_messages
        end
        redirect_to messages_path
    end
end
