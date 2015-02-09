require 'spec_helper'

def test_resumes(name)
  resume_paths = Dir.entries('./spec/resumes/').map { |e| "./spec/resumes/#{e}" }
  resume_paths.find { |r| File.basename(r) == name }
end

describe ResumeParser, '#pdf_to_string' do
  it 'can convert pdf to a string object' do
    pdf = test_resumes('ws-test.pdf')
    parser = ResumeParser.new(pdf)

    expect(parser.resume).to include 'Eco-Products'
  end

  it 'can convert docs to a string object' do
    docx = test_resumes('h-test.docx')
    parser = ResumeParser.new(docx)

    expect(parser.resume).to include 'WhiteWave'
  end
end

describe ResumeParser, '#extract_email' do
  it 'can find an email in a pdf with an email' do
    pdfs   = ['aa-test.pdf', 'ab-test.pdf', 'ah-test.pdf']
    emails = ['andreea.ayers@gmail.com', 'alicia.benjamin@gmail.com', 'al.hartung@Q.com']
    pdfs.each_with_index do |pdf, i|
      pdf_path = test_resumes(pdf)
      parser = ResumeParser.new(pdf_path)

      email = parser.extract_email

      expect(email).to eq emails[i]
    end
  end

  it 'can find an email in a docx with an email' do
    docxs  = ['h-test.docx', 'mn-test.docx', 'rh-test.docx']
    emails = ['aimee.horner@gmail.com', 'mnaito@yahoo.com', 'reidhislop@hotmail.com']
    docxs.each_with_index do |docx, i|
      docx_path = test_resumes(docx)
      parser = ResumeParser.new(docx_path)

      email = parser.extract_email

      expect(email).to eq emails[i]
    end
  end

  it 'can get an email from linkedin if not included in pdf' do
    skip
    docx = test_resumes('rs-test.docx')
    parser = ResumeParser.new(docx)

    email = parser.extract_email

    expect(email).to eq 'robertoseira@gmail.com'
  end

  it 'throws an error if neither linkedin or email are found' do
  end
end

describe ResumeParser, '#extract_linkedin' do
  it 'can find a linkedin url if one exists' do
    pdfs   = ['ab-test.pdf', 'ah-test.pdf']
    linkedins = ['linkedin.com/in/abenjamin', 'linkedin.com/pub/allan-al-hartung/6/73/638/']
    pdfs.each_with_index do |pdf, i|
      pdf_path = test_resumes(pdf)
      parser = ResumeParser.new(pdf_path)

      linkedin = parser.extract_linkedin

      expect(linkedin).to eq linkedins[i]
    end
  end

  it 'can find a linkedin url based on a provided email' do
  end
end
