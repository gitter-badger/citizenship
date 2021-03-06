describe 'Zip code validation' do
  it 'passes for valid Zip codes' do
    expect(Citizenship.valid_zip_code?('1000-100')).to be_truthy
  end

  it 'fails for invalid Zip codes' do
    expect {Citizenship.valid_zip_code!('1000')}.to raise_error(Citizenship::ZipCodeError)
    expect(Citizenship.valid_zip_code?('1000-00')).to be_falsy
    expect(Citizenship.valid_zip_code?(' 1000-000')).to be_falsy
    expect(Citizenship.valid_zip_code?('1000-100 ')).to be_falsy
    expect(Citizenship.valid_zip_code?('1000 - 100')).to be_falsy
  end
end
