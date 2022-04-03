describe SubmittedContentController do
  let(:super_admin) { build(:superadmin, id: 1, role_id: 5) }
  let(:instructor1) { build(:instructor, id: 10, role_id: 3, parent_id: 3, name: 'Instructor1') }
  let(:student1) { build(:student, id: 21, role_id: 1) }
  let(:team) { build(:assignment_team, id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }
  let(:assignment) { build(:assignment, id: 1) }
  describe '#submit_hyperlink' do
    context 'current user is participant and submits hyperlink' do
      before(:each) do
        allow(AssignmentParticipant).to receive(:find).and_return(participant)
        stub_current_user(student1, student1.role.name, student1.role)
        allow(participant).to receive(:team).and_return(team)
        allow(participant).to receive(:name).and_return('Name')
      end
      it 'flashes error if a duplicate hyperlink is submitted' do
        allow(team).to receive(:hyperlinks).and_return(['google.com'])
        params = {submission: "google.com", id: 21}
        response = get :submit_hyperlink, params: params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to eq 'You or your teammate(s) have already submitted the same hyperlink.'
      end
      it 'flashes error if url is invalid' do
        allow(team).to receive(:hyperlinks).and_return([])
        params = {submission: "abc123", id: 21}
        response = get :submit_hyperlink, params: params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to be_present # not checking message content since it uses #{$ERROR_INFO}
      end
    end
  end
  describe '#remove_hyperlink' do
    #NOTE - this method is not currently used, the below context is a start
    #       at proposed tests that may be useful in the future
    context 'current user is participant' do
      before(:each) do
        #allow(AssignmentParticipant).to receive(:find).and_return(participant)
        #stub_current_user(student1, student1.role.name, student1.role)
        #allow(participant).to receive(:team).and_return(team)
        #allow(team).to receive(:hyperlinks).and_return(['google.com'])
      end
      it 'redirects to edit if submissions are allowed' #do
        #params = {id: 1}
        #allow(assignment).to receive(:submission_allowed).and_return(true)
        #response = get :remove_hyperlink, params
        #expect(response).to redirect_to(action: :edit, id: 1)
      #end
      it 'redirects to view if submissions are not allowed' #do
        #params = {id: 1}
        #allow(assignment).to receive(:submission_allowed).and_return(true)
        #response = get :remove_hyperlink, params
        #expect(response).to redirect_to(action: :view, id: 1)
      #end
    end
  end
  describe '#submit_file' do
    context 'current user does not match up with the participant' do
      # this test has problems after rails 5.1 migration, getting 'undefined method 'size' for nil:NilClass' error
      # when 'check_content_size' method is called in submitted_content_controller, doesn't seem to be a problem in
      # other submit_file tests that should call the same method though...
      it 'renders edit template' #do
        #allow(AssignmentParticipant).to receive(:find).and_return(participant)
        #stub_current_user(instructor1, instructor1.role.name, instructor1.role)
        #request_params = { id: 1 }
        #response = get :submit_file, params: request_params
        #expect(response).to redirect_to(action: :edit, id: 1)
      #end
    end
    context 'user that is participant uploads a file' do
      before(:each) do
        allow(AssignmentParticipant).to receive(:find).and_return(participant)
        stub_current_user(student1, student1.role.name, student1.role)
      end
      it 'flashes error for file exceeding size limit' do
        allow(controller).to receive(:check_content_size).and_return(false)
        file = Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/the-rspec-book_p2_1.pdf")
        params = {uploaded_file: file,
                  id: 1}
        response = get :submit_file, params: params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to be_present # not checking message content since it uses variable size limit
      end
      it 'flashes error for file of unexpected type' do
        allow(SubmittedContentController).to receive(:check_content_type_integrity).and_return(false)
        allow(MimeMagic).to receive(:by_magic).and_return("not valid")
        allow_any_instance_of(Rack::Test::UploadedFile::String).to receive(:read).and_return("")
        file = Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/helloworld.c")
        params = {uploaded_file: file,
                  id: 1}
        response = get :submit_file, params: params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to eq 'File type error'
      end
      # we could test that file is written and submission record is created, but we could have to
      # make assumptions about how path is formed and user input for path/filename is sanitized.  We don't want
      # this test coupled to the existing implementation
    end
  end
  describe '#folder_action' do
    context 'current user does not match up with the participant' do
      #method just returns in this context, how do we test that?
    end
    context 'current user is participant performing folder action' do
      before(:each) do
        allow(AssignmentParticipant).to receive(:find).and_return(participant)
        stub_current_user(student1, student1.role.name, student1.role)
      end
      it 'redirects to edit' #do
        #params = {id: 1, faction: nil}
        #response = get :folder_action, params
        #expect(response).to redirect_to(action: :edit, id: 1)
      #end
      it 'delete action deletes selected files'
      it 'rename action renames selected file'
      it 'move action moves selected file'
      it 'copy action copies selected file'
      it 'create folder action creates new directory'
    end
  end
  describe '#download' do
    context 'user downloads file' do
      it 'flashes error for nil folder name' do
        params = {folder_name: nil}
        response = get :download, params: params
        expect(flash[:error]).to be_present # not checking message content since it uses exception message
      end
      it 'flashes error for nil file name' do
        params = {name: nil}
        response = get :download, params: params
        expect(flash[:error]).to be_present # not checking message content since it uses exception message
      end
      it 'flashes error if attempt is to download entire folder' do
        params = {folder_name: 'test_directory', name: nil}
        response = get :download, params: params
        expect(flash[:error]).to be_present # not checking message content since it uses exception message
      end
      it 'flashes error if file does not exist' do
        params = {folder_name: 'unlikely_dir_name', name: 'nonexistantfile.no'}
        response = get :download, params: params
        expect(flash[:error]).to be_present #not checking message content since it uses exception message
      end
      it 'calls send for a valid file download' do
        # still figuring this one out...
        #params = {folder_name: 'test_dir', name: 'test.txt'}
        #File.stub(:exist?).and_return(true)
        #response = get :download, params
        #expect(download).to receive(:send_file)
      end
    end
  end

  #########################################
  let(:student1) { build_stubbed(:student, id: 21, role_id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }
  describe 'student#view' do
    it 'student#view it' do
      #puts('-----STUDENT#view--------')
      allow(AssignmentParticipant).to receive(:find).and_return(participant)
      stub_current_user(student1, student1.role.name, student1.role)
      allow(participant).to receive(:name).and_return('Name')
      params = { id: 21 }
      response = get :view, params: params
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
      response = get :view, params: params
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
      response = get :view, params: params
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
      response = get :edit, params: params
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
      response = get :edit, params: params
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
      response = get :edit, params: params
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
