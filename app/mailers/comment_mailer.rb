class CommentMailer < ActionMailer::Base

    def comment_created(current_user, post_user, content)

        @current_user = current_user
        @post_user = post_user
        @content = content

        mail(
            to: post_user.email,
            from: "...", #doesnt matter when using gmail
            subject: current_user.name + " commented on your post."
        )
    end
end