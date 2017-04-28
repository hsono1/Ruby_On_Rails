require_relative "project"
RSpec.describe Project do
	before(:each) do
		@project1 = Project.new('Project1', "description1", "owner1")
	end
	it "has a getter and setter for name attribute" do
		@project1.name = "Changed Name"
		expect(@project1.name).to eq("Changed Name")
	end
	it "has a getter and setter for owner attribute" do
		@project1.owner = "Changed owner"
		expect(@project1.owner).to eq("Changed owner")
	end
	it "has a method add_task and task attribute working" do
		@project1.add_tasks "task1"
		expect(@project1.task).to eq(["task1"])
	end
	it 'has a method print_tasks that prints every task in the project' do
      1.upto(2) { |n| @project1.add_tasks("Task # #{n}") }
      expect{ @project1.print_tasks }.to output("Task # 1\nTask # 2\n").to_stdout
    end

end