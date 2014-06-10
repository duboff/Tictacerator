require 'cell'

describe Cell do
  let(:cell) {Cell.new}

  context 'value' do
    it 'is defined' do
      expect(cell).to respond_to(:value)
    end

    it 'is nil if not specified' do
      expect(cell.value).to eq nil
    end
  end
end