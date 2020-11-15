
describe file('C:/Windows/explorer.exe') do
  it { should exist }
  it { should be_file }
end
