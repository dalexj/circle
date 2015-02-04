require 'spec_helper'

resume_paths = Dir.entries('./spec/resumes/').map { |e| "./spec/resumes/#{e}" }

describe ResumeParser, '#pdf_to_string' do 
  it 'can convert pdf to a string object' do
    parser = ResumeParser.new(resume_paths.last) 

    expect(parser.resume).to include "Eco-Products"
  end

  it 'can convert docs to a string object' do
    docx = resume_paths.find { |r| File.basename(r) == "h-test.docx" }
    parser = ResumeParser.new(docx) 

    expect(parser.resume).to include "WhiteWave"
  end
end


