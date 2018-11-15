require 'Player'


describe Player do
  let(:player) {Player.new('Bob')}

  it 'will return its name' do
    expect(player.name).to eq('Bob')
  end

end
