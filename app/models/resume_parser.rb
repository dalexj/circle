class ResumeParser
  attr_reader :resume

  def initialize(resume_path)
    @resume = pdf_to_string(resume_path)
  end

  def extract_email
    email_from_resume || email_from_linkedin
  end

  def extract_linkedin
    linkedin_from_resume || linkedin_from_email
  end

  private

  def linkedin_from_resume
    match = linkedin_regex.match(resume)
    match[0] if match
  end

  def linkedin_from_email
  end

  def email_from_resume
    match = email_regex.match(resume)
    match[0] if match
  end

  def email_from_linkedin
  end

  def pdf_to_string(resume_path)
    Docsplit.extract_text([resume_path], ocr: false, output: Dir.tmpdir)
    txt = File.basename(resume_path, File.extname(resume_path)) + '.txt'
    txt_path = Dir.tmpdir + '/' + txt
    extracted = File.read(txt_path)
    File.delete(txt_path)
    extracted
  end

  def email_regex
    /[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+/i
  end

  def linkedin_regex
    /linkedin.com\S*/
  end
end
