class ResumeParser
  attr_reader :resume

  def initialize(resume_path)
    @resume = pdf_to_string(resume_path)
  end

  def extract_email
    email_regex.match(resume)[0]
  end

  def extract_linkedin
    linkedin_regex.match(resume)[0]
  end

  private

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
