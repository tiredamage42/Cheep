class PostMailer < ActionMailer::Base

    def post_created(user)


        mail(
            to: user.email,
            from: "...", #doesnt matter when using gmail
            subject: "Post Created!",
            body: "This is my first mailer!"
        )
    end
end