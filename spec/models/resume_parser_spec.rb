require 'spec_helper'

resume_paths = Dir.entries('./spec/resumes/').map { |e| "./spec/resumes/#{e}" }

describe ResumeParser, '#pdf_to_string' do
  it 'can convert pdf to a string object' do
    pdf = resume_paths.find { |r| File.basename(r) == 'ws-test.pdf' }
    parser = ResumeParser.new(pdf)

    expect(parser.resume).to include 'Eco-Products'
  end

  it 'can convert docs to a string object' do
    docx = resume_paths.find { |r| File.basename(r) == 'h-test.docx' }
    parser = ResumeParser.new(docx)

    expect(parser.resume).to include 'WhiteWave'
  end
end
