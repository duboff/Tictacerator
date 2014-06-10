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

    it 'can be set to 1 or 0' do
      cell.value = 1
      expect(cell.value).to eq 1
      cell.value = 0
      expect(cell.value).to eq 0
    end
  end

  context 'checks' do
    
    it 'if it is empty' do
      expect(cell).to be_empty
    end

    it 'if value is x' do
      cell.value = 1
      expect(cell).to be_x
    end
    it 'if value is y' do
      cell.value = 0
      expect(cell).to be_o
    end
  end
end