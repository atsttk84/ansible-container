require 'spec_helper'

describe command('docker-compose exec alpine sh -c "type ansible-container"') do
  its(:exit_status) { should eq 0 }
end

describe command('docker-compose exec ubuntu sh -c "type ansible-container"') do
  its(:exit_status) { should eq 0 }
end

describe command('docker-compose exec centos sh -c "type ansible-container"') do
  its(:exit_status) { should eq 0 }
end
