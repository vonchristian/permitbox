require 'rails_helper'

describe ProperCaser do
  it { expect(ProperCaser.new(text: " puhot").propercase).to eql "Puhot" }
  it { expect(ProperCaser.new(text: "dad-an ").propercase).to eql "Dad-an" }
  it { expect(ProperCaser.new(text: "mary ann ").propercase).to eql "Mary Ann" }
  it { expect(ProperCaser.new(text: "VEVERLY MARCOS").propercase).to eql "Veverly Marcos" }
end
