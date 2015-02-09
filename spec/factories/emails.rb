FactoryGirl.define do
  # email = build(:email, :with_attachment)
  factory :email, class: OpenStruct do
    to [{ full: 'to_user@email.com', email: 'to_user@email.com', token: 'to_user', host: 'email.com', name: nil }]
    from(token: 'from_user', host: 'email.com', email: 'from_email@email.com', full: 'From User <from_user@email.com>', name: 'From User')
    subject 'email subject'
    body 'Hello!'
    attachments { [] }

    trait :with_attachment do
      attachments do
        [
          ActionDispatch::Http::UploadedFile.new(
            filename: 'aa-test.pdf',
            type: 'image/pdf',
            tempfile: File.new("#{File.expand_path(File.dirname(__FILE__))}/resumes/aa-test.pdf")
        )
        ]
      end
    end
  end
end
