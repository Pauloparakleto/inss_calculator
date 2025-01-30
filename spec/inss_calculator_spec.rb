# frozen_string_literal: true

require 'spec_helper'

include InssCalculator

RSpec.describe InssCalculator::SalaryLevels do
  describe 'FIRST_SALARY_BASE' do
    it 'is equal to 0.0' do
      expect(described_class::FIRST_SALARY_BASE).to eq(0.0)
    end
  end

  describe 'FIRST_SALARY_LIMIT' do
    it 'is equal to 1518.0' do
      expect(described_class::FIRST_SALARY_LIMIT).to eq(1518.0)
    end
  end
  
  describe 'SECOND_SALARY_BASE' do
    it 'is equal to 1518.01' do
      expect(described_class::SECOND_SALARY_BASE).to eq(1518.01)
    end
  end
  
  describe 'SECOND_SALARY_LIMIT' do
    it 'is equal to 2793.88' do
      expect(described_class::SECOND_SALARY_LIMIT).to eq(2793.88)
    end
  end
  
  describe 'THIRD_SALARY_BASE' do
    it 'is equal to 2793.89' do
      expect(described_class::THIRD_SALARY_BASE).to eq(2793.89)
    end
  end
  
  describe 'THIRD_SALARY_LIMIT' do
    it 'is equal to 4190.83' do
      expect(described_class::THIRD_SALARY_LIMIT).to eq(4190.83)
    end
  end
  
  describe 'FOURTH_SALARY_BASE' do
    it 'is equal to 4190.84' do
      expect(described_class::FOURTH_SALARY_BASE).to eq(4190.84)
    end
  end
 
  describe 'FOURTH_SALARY_LIMIT' do
    it 'is equal to 8157.41' do
      expect(described_class::FOURTH_SALARY_LIMIT).to eq(8157.41)
    end
  end
 
  describe 'FIFTH_SALARY_BASE' do
    it 'is equal to 8157.42' do
      expect(described_class::FIFTH_SALARY_BASE).to eq(8157.42)
    end
  end
 
  describe 'FIFTH_SALARY_LIMIT' do
    it 'is equal to 13969.49' do
      expect(described_class::FIFTH_SALARY_LIMIT).to eq(13969.49)
    end
  end
 
  describe 'SIXTH_SALARY_BASE' do
    it 'is equal to 13969.50' do
      expect(described_class::SIXTH_SALARY_BASE).to eq(13969.50)
    end
  end
 
  describe 'SIXTH_SALARY_LIMIT' do
    it 'is equal to 27938.95' do
      expect(described_class::SIXTH_SALARY_LIMIT).to eq(27938.95)
    end
  end
 
  describe 'SEVENTH_SALARY_BASE' do
    it 'is equal to 27938.96' do
      expect(described_class::SEVENTH_SALARY_BASE).to eq(27938.96)
    end
  end
 
  describe 'SEVENTH_SALARY_LIMIT' do
    it 'is equal to 54480.97' do
      expect(described_class::SEVENTH_SALARY_LIMIT).to eq(54480.97)
    end
  end
 
  describe 'EIGTH_SALARY_BASE' do
    it 'is equal to 54480.98' do
      expect(described_class::EIGTH_SALARY_BASE).to eq(54480.98)
    end
  end

  describe 'EIGTH_SALARY_LIMIT' do
    it 'is equal to Float::INFINITY' do
      expect(described_class::EIGTH_SALARY_LIMIT).to eq(Float::INFINITY)
    end
  end
end
