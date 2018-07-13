require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('TW106TF') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200
    end

    it "should have a results hash" do
      expect(@response).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect((@response)['result']['postcode'].length-1).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect((@response)['result']['quality']).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect((@response)['result']['eastings']).to be_a Integer
    end

    it "should return an ordnance survey northings value as integer" do
      expect((@response)['result']['northings']).to be_a Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect((@response)['result']['country']).to eql('England').or eql('Scotland').or eql('Wales').or eql('Ireland')
    end

    it "should return a string value for NHS authority " do
      expect((@response)['result']['nhs_ha']).to be_a String
    end

    it "should return a longitude float value" do
      expect((@response)['result']['longitude']).to be_a Float
    end

    it "should return a latitude float value" do
      expect((@response)['result']['latitude']).to be_a Float
    end

    it "should return a parliamentary constituency string" do
      expect((@response)['result']['parliamentary_constituency']).to be_a String
    end

    it "should return a european_electoral_region string" do
      expect((@response)['result']['european_electoral_region']).to be_a String
    end

    it "should return a primary_care_trust string" do
      expect((@response)['result']['primary_care_trust']).to be_a String
    end

    it "should return a region string" do
      expect((@response)['result']['region']).to be_a String
    end

    it "should return a parish string" do
      expect((@response)['result']['parish']).to be_a String
    end

    it "should return a lsoa string" do
      expect((@response)['result']['lsoa']).to be_a String
    end

    it "should return a msoa string" do
      expect((@response)['result']['msoa']).to be_a String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect((@response)['result']['admin_district']).to be_a String
    end

    it "should return a incode string of three characters" do
      expect((@response)['result']['incode']).to be_a String
      expect((@response)['result']['incode'].length).to eql 3
    end

    it "should return a msoa string" do
      expect((@response)['result']['msoa']).to be_a String
    end

    it "should return a outcode string of 3-4 characters" do
      expect((@response)['result']['outcode']).to be_a String
      expect((@response)['result']['outcode'].length).to be_between(3,4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['TW106TF','TW106TF','ME90PR']) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@response['status']).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
    end

    it "should return the second query as the first postcode in the response" do
    end

    it "should have a results hash" do
      expect(@response).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
      @response['result'].each do |value|
        expect((value)['result']['postcode'].length-1).to be_between(5,7)
      end
    end

    it "should return an quality key integer between 1-9" do
      @response['result'].each do |value|
        expect((value)['result']['quality']).to be_between(1,9)
      end
    end

    it "should return an ordnance survey eastings value as integer" do
      @response['result'].each do |value|
        expect((value)['result']['eastings']).to be_a Integer
      end
    end

    it "should return an ordnance survey northings value as integer" do
      @response['result'].each do |value|
        expect((value)['result']['northings']).to be_a Integer
      end
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      @response['result'].each do |value|
        expect((value)['result']['country']).to eql('England').or eql('Scotland').or eql('Wales').or eql('Ireland')
      end
    end

    it "should return a string value for NHS authority " do
      @response['result'].each do |value|
        expect((value)['result']['nhs_ha']).to be_a String
      end
    end

    it "should return a longitude float value" do
      @response['result'].each do |value|
        expect((value)['result']['longitude']).to be_a Float
      end
    end

    it "should return a latitude float value" do
      @response['result'].each do |value|
        expect((value)['result']['latitude']).to be_a Float
      end
    end

    it "should return a parliamentary constituency string" do
      @response['result'].each do |value|
        expect((value)['result']['parliamentary_constituency']).to be_a String
      end
    end

    it "should return a european_electoral_region string" do
      @response['result'].each do |value|
        expect((value)['result']['european_electoral_region']).to be_a String
      end
    end

    it "should return a primary_care_trust string" do
      @response['result'].each do |value|
        expect((value)['result']['primary_care_trust']).to be_a String
      end
    end

    it "should return a region string" do
      @response['result'].each do |value|
        expect((value)['result']['region']).to be_a String
      end
    end

    it "should return a parish string" do
      @response['result'].each do |value|
        expect((value)['result']['parish']).to be_a String
      end
    end

    it "should return a lsoa string" do
      @response['result'].each do |value|
        expect((value)['result']['lsoa']).to be_a String
      end
    end

    it "should return a msoa string" do
      @response['result'].each do |value|
        expect((value)['result']['msoa']).to be_a String
      end
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      @response['result'].each do |value|
        expect((value)['result']['admin_district']).to be_a String
      end
    end

    it "should return a incode string of three characters" do
      @response['result'].each do |value|
        expect((value)['result']['incode']).to be_a String
        expect((value)['result']['incode'].length).to eql 3
      end
    end

    it "should return a msoa string" do
      @response['result'].each do |value|
        expect((value)['result']['msoa']).to be_a String
      end
    end

    it "should return a incode string of 3-4 characters" do
      @response['result'].each do |value|
        expect((value)['result']['outcode']).to be_a String
        expect((value)['result']['outcode'].length).to be_between(3,4)
      end
    end
# =====================================
    it "should have a results hash" do
    end

    it "should return a postcode between 5-7 in length"  do
    end

    it "should return an quality key integer between 1-9" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return a country which is one of the four constituent countries of the UK" do
    end

    it "should return a string value for NHS authority " do
    end

    it "should return a longitude float value" do
    end

    it "should return a latitude float value" do
    end

    it "should return a parliamentary constituency string" do
    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a msoa string" do
    end

    it "should return a incode string of 3-4 characters" do
    end

  end


end
