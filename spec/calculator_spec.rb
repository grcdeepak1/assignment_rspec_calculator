require_relative '../lib/calculator'
describe Calculator do
  let(:calc){ Calculator.new}

  describe '#initialize' do
    it 'should give you a calculator' do
      expect(calc).to be_a(Calculator)
    end
    it 'should not raise error if optional 1 argument is passed' do
      expect { Calculator.new(true) }.not_to raise_error
    end
    it 'should raise exception if passed in more than 1 arguments' do
      expect { Calculator.new(5, 2) }.to raise_error(ArgumentError)
    end
  end

  describe '#add' do
    let(:calc){ Calculator.new}
    it 'adds 2 positive numbers' do
      expect(calc.add(1,3)).to eq(4)
    end
    it 'adds 1 positive and 1 negative number' do
      expect(calc.add(1,-3)).to eq(-2)
    end
    it 'adds 2 negative numbers' do
      expect(calc.add(-1,-3)).to eq(-4)
    end
  end

  describe '#subtract' do
    let(:calc){ Calculator.new}
    it 'subtracts 2 positive numbers' do
      expect(calc.subtract(1,3)).to eq(-2)
    end
    it 'subtracts 1 positive and 1 negative number' do
      expect(calc.subtract(1,-3)).to eq(4)
    end
    it 'subtracts 2 negative numbers' do
      expect(calc.subtract(-1,-3)).to eq(2)
    end
  end

  describe '#multiply' do
    let(:calc){ Calculator.new}
    it 'multiplies 2 positive numbers' do
      expect(calc.multiply(2,3)).to eq(6)
    end
    it 'multiplies 1 positive and 1 negative number' do
      expect(calc.multiply(2,-3)).to eq(-6)
    end
    it 'multiplies 2 negative numbers' do
      expect(calc.multiply(-2,-3)).to eq(6)
    end
    it 'multiplies 0 with any number' do
      expect(calc.multiply(0,-3)).to eq(0)
    end
    it 'multiplies 1 with any number' do
      expect(calc.multiply(0,9)).to eq(0)
    end
  end

  describe '#divide' do
    let(:calc){ Calculator.new}
    it 'divides 2 positive numbers' do
      expect(calc.divide(9,3)).to eq(3)
    end
    it 'divides 1 positive and 1 negative number' do
      expect(calc.divide(9,-3)).to eq(-3)
    end
    it 'divides 2 negative numbers' do
      expect(calc.divide(-9,-3)).to eq(3)
    end
    it 'divides any number with 0 raises error ArgumentError' do
      expect { calc.divide(9,0) }.to raise_error(ArgumentError)
    end
  end

  describe '#pow' do
    let(:calc){ Calculator.new}
    it 'power 2 positive numbers' do
      expect(calc.pow(2,3)).to eq(8)
    end
    it 'power 1 positive number over 1 negative number' do
      expect(calc.pow(25,-2)).to eq(0.0016)
    end
    it 'power 1 negative number over 1 positive number' do
      expect(calc.pow(-4,3)).to eq(-64)
    end
    it 'power 2 negative numbers' do
      expect(calc.pow(-25,-2)).to eq(0.0016)
    end
    it 'power 0 over any number' do
      expect(calc.pow(5,0)).to eq(1)
    end
    it 'power 1 over any number' do
      expect(calc.pow(5,1)).to eq(5)
    end
  end

  describe '#sqrt' do
    let(:calc){ Calculator.new}
    it 'sqrt of positive number' do
      expect(calc.sqrt(9)).to eq(3)
    end
    it 'sqrt of negative number' do
      expect { calc.sqrt(-9) }.to raise_error(ArgumentError)
    end
    it 'sqrt of 1' do
      expect(calc.sqrt(1)).to eq(1)
    end
    it 'sqrt of 0' do
      expect(calc.sqrt(0)).to eq(0)
    end
  end
  describe '#memory' do
    let(:calc){ Calculator.new}
    let(:calc_new){ Calculator.new}
    before do
      calc.memory = 8
    end
    it 'memory of new calculator' do
      expect(calc_new.memory).to eq(nil)
    end
    it 'memory persists calc' do
      expect(calc.memory).to eq(8)
    end
    it "clears memory" do
      expect(calc.memory).to eq(8)
      expect(calc.memory).to eq(nil)
    end
  end

  describe "stringify calculator" do
    let(:str_calc) { Calculator.new(true) }
    it 'add returns a string' do
      expect(str_calc.add(1,3)).to eq("4")
    end
  end

end