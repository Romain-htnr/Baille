class Home < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :entreprise
  attribute :telephone
  attribute :file, :attachment => true
  attribute :nickname, :captcha => true
  # validate :correct_document_mime_type
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Retour formulaire landing page",
      :to => "romain.hethener@gmail.com",
      :from => %("#{name}" <#{email}>),
    }
  end

  def sendattachment(email)
    if email.has_attachments?
      for attachment in email.attachments
        page.attachments.create({
          :file => attachment,
          :description => email.subject
        })
      end
    end
  end
end
