class ResumeParser
  attr_reader :resume

  def initialize(resume_path)
    @resume = pdf_to_string(resume_path)
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
end
