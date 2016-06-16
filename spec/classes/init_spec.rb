require 'spec_helper'
describe 'root' do

  context 'with defaults for all parameters' do
    it { should contain_class('root') }
  end
end
