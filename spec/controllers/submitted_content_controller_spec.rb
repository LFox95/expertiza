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





  # let(:super_adminA) { build(:superadmin, id: 1, role_id: 2) }
  # let(:instructorA) { build(:instructor, id: 3, role_id: 4, parent_id: 5, name: 'InstructorA') }
  # let(:studentA) { build(:student, id: 6, role_id: 7) }
  # let(:participantA) { build(:participant, id: 8, user_id: 9) }

  # describe '#action_allowed?' do
  #   context 'action_allowed? context' do
  #     it 'action_allowed? it statement' do
  #       puts('-----start test: action_allowed?-----')
  #       allow(AssignmentParticipant).to receive(:find).and_return(participantA)
  #       puts('-----test: action_allowed? A-----')
  #       stub_current_user(instructorA, instructorA.role.name, instructorA.role)
  #       puts('-----test: action_allowed? B-----')
  #       params = {action: 'edit'}
  #       puts('-----test: action_allowed? C-----')
  #       controller.params = params
  #       puts('-----test: action_allowed? D-----')
  #       expect(controller.action_allowed?).to eq(true)
  #       puts('-----end test: action_allowed?-----')
  #     end
  #   end
  # end



  # describe 'participant#edit' do
  #   it 'participant#edit it' do
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     stub_current_user(participantA, 'PANAme', super_adminA.role)
  #     # allow(ContentPage).to receive(:find).with('1').and_return(content_page_home)
  #     # allow(MarkupStyle).to receive(:order).with('name').and_return([@markup_style])
  #     # allow(Permission).to receive(:order).with('name').and_return([@permission])
  #     # allow(MenuItem).to receive_message_chain(:order, :where).and_return(MenuItem.new(content_page_id: 1))
  #     # controller.instance_variable_set(:@settings, SystemSettings.new(site_default_page_id: 1))
  #     # allow(controller.instance_variable_get(:@settings)).to receive(:system_pages).with(1).and_return(['Site default page'])
  #     params = { id: 1, reader: true, reviewer: true }
  #     response = get :edit, params
  #     expect(response).to render_template(:edit)
  #   end
  # end



  # describe '#edit' do
  #   context 'edit context' do
  #     it 'edit it statement' do
  #       puts('-----start test: edit-----')
  #       allow(AssignmentParticipant).to receive(:find).and_return(participantA)
  #       puts('-----test: edit A-----')
  #       stub_current_user(instructorA, instructorA.role.name, instructorA.role)
  #       puts('-----test: edit B-----')
  #       params = {id: 8}
  #       puts('-----test: edit C-----')
  #       response = get :edit, params 
  #       puts('-----test: edit D-----')
  #       expect(response).to redirect_to(action: :edit, id: 8)
  #       puts('-----end test: edit-----')
  #     end
  #   end
  # end

  # describe '2#edit' do
  #   context '2edit context' do
  #     it '2edit it statement' do
  #       puts('---2edit---')
  #       allow(AssignmentParticipant).to receive(:find).and_return(participantA)
  #       stub_current_user(participantA, 'ParticipantAName', Participant)
  #       params = {id: 8}
  #       response = get :edit, params 
  #       expect(response).to redirect_to(action: :edit, id: 8)
  #     end
  #   end
  # end

  # describe '#view' do
  #   context 'view context' do
  #     it 'view it statement' do
  #       puts('---view---')
  #       allow(AssignmentParticipant).to receive(:find).and_return(participantA)
  #       stub_current_user(instructorA, instructorA.role.name, instructorA.role)
  #       params = {id: 8}
  #       response = get :view, params 
  #       expect(response).to redirect_to(action: :edit, id: 8)
  #     end
  #   end
  # end




  # describe '1#view' do
  #   context '1current user does not match up with the participant for view' do
  #     it '1fails out' do
  #       puts('---1view---')
  #       #21 / false
  #       allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #       stub_current_user(instructor1, instructor1.role.name, instructor1.role)
  #       params = {id: 1}
  #       response = get :view, params 
  #       expect(response).to redirect_to(action: :edit, id: 1)
  #     end
  #   end
  # end



  # # let(:super_admin) { build(:superadmin, id: 1, role_id: 5) }
  # # let(:instructor1) { build(:instructor, id: 10, role_id: 3, parent_id: 3, name: 'Instructor1') }
  # let(:student1) { build_stubbed(:student, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }

  # describe 'student#edit' do
  #   it 'student#edit it' do
  #     puts('-----STUDENT#EDIT--------')
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     stub_current_user(student1, student1.role.name, student1.role)
  #     allow(participant).to receive(:name).and_return('Name')
  #     params = { id: 21 }
  #     response = get :edit, params
  #     expect(response).to redirect_to(action: :edit, id: 1)
  #   end
  # end


  # let(:instructor1) { build_stubbed(:instructor, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }

  # describe 'instructor#edit' do
  #   it 'instructor#edit it' do
  #     puts('-----instructor#EDIT--------')
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     stub_current_user(instructor1, instructor1.role.name, instructor1.role)
  #     allow(participant).to receive(:name).and_return('Name')
  #     params = { id: 21 }
  #     response = get :edit, params
  #     expect(response).to redirect_to(action: :edit, id: 1)
  #   end
  # end


  # let(:superadmin1) { build_stubbed(:superadmin, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }

  # describe 'superadmin#edit' do
  #   it 'superadmin#edit it' do
  #     puts('-----superadmin#EDIT--------')
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     stub_current_user(superadmin1, superadmin1.role.name, superadmin1.role)
  #     allow(participant).to receive(:name).and_return('Name')
  #     params = { id: 21 }
  #     response = get :edit, params
  #     expect(response).to redirect_to(action: :edit, id: 1)
  #   end
  # end






  
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

  # let(:student1) { build_stubbed(:student, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }

  # describe 'student#edit' do
  #   it 'student#edit it' do
  #     #puts('-----STUDENT#edit--------')
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     allow(Participant).to receive(:find_by).and_return(participant)
  #     stub_current_user(student1, student1.role.name, student1.role)
  #     allow(participant).to receive(:name).and_return('Name')
  #     params = { id: 21 }
  #       puts('----t2----')
  #       participantY = Participant.find_by(id: 21)  ##nil with 21 and 1
  #       puts('-----t2a----')
  #       puts(participantY.nil?)
  #     response = get :edit, params
  #     expect(response).to render_template(:edit)
  #   end
  # end


  # let(:instructor1) { build_stubbed(:instructor, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }

  # describe 'instructor#edit' do
  #   it 'instructor#edit it' do
  #     #puts('-----instructor#edit--------')
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     allow(Participant).to receive(:find_by).and_return(participant)
  #     stub_current_user(instructor1, instructor1.role.name, instructor1.role)
  #     allow(participant).to receive(:name).and_return('Name')
  #     params = { id: 21 }
  #     response = get :edit, params
  #     expect(response).to render_template(:edit)
  #     #puts('------instructor#edit END -------')
  #   end
  # end


  # let(:superadmin1) { build_stubbed(:superadmin, id: 21, role_id: 1) }
  # let(:participant) { build(:participant, id: 1, user_id: 21) }

  # describe 'superadmin#edit' do
  #   it 'superadmin#edit it' do
  #     #puts('-----superadmin#edit--------')
  #     allow(AssignmentParticipant).to receive(:find).and_return(participant)
  #     allow(Participant).to receive(:find_by).and_return(participant)
  #     stub_current_user(superadmin1, superadmin1.role.name, superadmin1.role)
  #     allow(participant).to receive(:name).and_return('Name')
  #     params = { id: 21 }
  #     response = get :edit, params
  #     expect(response).to render_template(:edit)
  #   end
  # end


###################################
##  .to be_truthy
##  .to be_falsey

### From link from Nick
# it "should do a thing" do
#   my_object = MyObject.new
#   my_object.send(:do_things_with_message, some_message)
#   my_object.thing.should == true
# end

###NEED TO DO check_content_size

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
