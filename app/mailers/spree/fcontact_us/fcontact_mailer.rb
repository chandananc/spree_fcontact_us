class Spree::FcontactUs::FcontactMailer < Spree::BaseMailer
  def fcontact_email(fcontact)
    @fcontact = fcontact

    mail :from     => (SpreeFcontactUs.mailer_from || @fcontact.email),
         :reply_to => @fcontact.email,
         :subject  => (SpreeFcontactUs.require_subject ? @fcontact.subject : Spree.t(:subject, :email => @fcontact.email)),
         :to       => SpreeFcontactUs.mailer_to
  end
end