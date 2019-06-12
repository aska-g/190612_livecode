require_relative "../citizen"

describe Citizen do
  describe '#can_vote?' do
    it 'returns false if age < 18' do
      citizen = Citizen.new('john', 'doe', 15)

      expect(citizen.can_vote?).to eq(false)
    end

    it 'returns true if age >= 18' do
      citizen = Citizen.new('john', 'doe', 30)

      expect(citizen.can_vote?).to eq(true)
    end
  end


  describe '#full_name' do
    it 'returns a correctly formatted name' do
      citizen = Citizen.new('john', 'doe', 30)

      expect(citizen.full_name).to eq('John Doe')
    end
  end
end
