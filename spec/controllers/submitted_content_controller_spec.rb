describe SubmittedContentController do
  # let(:super_admin) { build(:superadmin, id: 1, role_id: 5) }
  # let(:instructor1) { build(:instructor, id: 10, role_id: 3, parent_id: 3, name: 'Instructor1') }
  # let(:student1) { build(:student, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }
  
  # describe '#submit_file' do
  #   context 'current user does not match up with the participant' do
  #     it 'renders edit template' do
  #       puts('-----start test: submit_file-----')
  #       allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #       stub_current_user(instructor1, instructor1.role.name, instructor1.role)
  #       params = {id: 1}
  #       response = get :submit_file, params 
  #       expect(response).to redirect_to(action: :edit, id: 1)
  #       puts('-----end test: submit_file-----')
  #     end
  #   end
  # end

  # let(:super_admin) { build(:superadmin, id: 1, role_id: 2) }
  # let(:instructor1) { build(:instructor, id: 3, role_id: 4, parent_id: 5, name: 'Instructor1') }
  # let(:student1) { build(:student, id: 6, role_id: 7) }
  # let(:participant) { build(:participant, id: 8, user_id: 9) }
  # describe '#submit_file' do
  #   context 'current user does not match up with the participant' do
  #     it 'renders edit template' do
  #       #here the user_id=9, current_user.try(:id)=3
  #       allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #       stub_current_user(instructor1, instructor1.role.name, instructor1.role)
  #       params = {id: 8}
  #       response = get :submit_file, params 
  #       expect(response).to redirect_to(action: :edit, id: 8)
  #     end
  #   end
  # end

  ###########################

  let(:student1) { build_stubbed(:student, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }

  describe 'student#view' do
    it 'student#view it' do
      #puts('-----STUDENT#view--------')
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      stub_current_user(student1, student1.role.name, student1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      response = get :view, params
      expect(response).to redirect_to(action: :edit, view: true, id: 21)
    end
  end


  let(:instructor1) { build_stubbed(:instructor, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }

  describe 'instructor#view' do
    it 'instructor#view it' do
      #puts('-----instructor#view--------')
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      stub_current_user(instructor1, instructor1.role.name, instructor1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      #puts('-------inst a-----------')
      response = get :view, params
      #puts('-------inst b-----------')
      expect(response).to redirect_to(action: :edit, view: true, id: 21)
    end
  end


  let(:superadmin1) { build_stubbed(:superadmin, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }

  describe 'superadmin#view' do
    it 'superadmin#view it' do
      #puts('-----superadmin#view--------')
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      stub_current_user(superadmin1, superadmin1.role.name, superadmin1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      response = get :view, params
      expect(response).to redirect_to(action: :edit, view: true, id: 21)
    end
  end


  ################################

  ## these only work when are_needed_authorizations_present? is hardcode return true; missing perms bc have nil participant?
    ## then need to know how to set perms
  ## also ask about the coverage report (index.html not opening)
  ## ask about prog2 grading rubric?

  let(:student1) { build_stubbed(:student, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }

  describe 'student#edit' do
    it 'student#edit it' do
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      allow(Participant).to receive(:find_by).and_return(participant)
      stub_current_user(student1, student1.role.name, student1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      response = get :edit, params
      expect(response).to render_template(:edit)
    end
  end


  let(:instructor1) { build_stubbed(:instructor, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }

  describe 'instructor#edit' do
    it 'instructor#edit it' do
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      allow(Participant).to receive(:find_by).and_return(participant)
      stub_current_user(instructor1, instructor1.role.name, instructor1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      response = get :edit, params
      expect(response).to render_template(:edit)
    end
  end


  let(:superadmin1) { build_stubbed(:superadmin, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }

  describe 'superadmin#edit' do
    it 'superadmin#edit it' do
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      allow(Participant).to receive(:find_by).and_return(participant)
      stub_current_user(superadmin1, superadmin1.role.name, superadmin1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      response = get :edit, params
      expect(response).to render_template(:edit)
    end
  end


###################################
##  .to be_truthy
##  .to be_falsey

### From link from Nick
# it "should do a thing" do
#   my_object = MyObject.new
#   my_object.send(:do_things_with_message, some_message)
#   my_object.thing.should == true
# end

### NEED TO DO check_content_type_integrity

describe '#check_content_size' do
  it "file size 500 should succeed" do
    testfile = instance_double(File, read: 'testing read', size: 500)
    expect(controller.send(:check_content_size, testfile, 1)).to be_truthy
  end
  it "file size 5,000,000 should fail" do
    testfile = instance_double(File, read: 'testing read', size: 5000000)
    expect(controller.send(:check_content_size, testfile, 1)).to be_falsey
  end
end

describe '#file_type' do
  it 'type should be png' do
    expect(controller.send(:file_type, 'test.png')).to eql('png')
  end
  it 'type should be txt' do
    expect(controller.send(:file_type, 'test.png.txt')).to eql('txt')
  end
end



end
