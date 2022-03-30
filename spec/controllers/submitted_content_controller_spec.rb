describe SubmittedContentController do
  let(:super_admin) { build(:superadmin, id: 1, role_id: 5) }
  let(:instructor1) { build(:instructor, id: 10, role_id: 3, parent_id: 3, name: 'Instructor1') }
  let(:student1) { build(:student, id: 21, role_id: 1) }
  let(:team) { build(:assignment_team, id: 1) }
  let(:participant) { build(:participant, id: 1, user_id: 21) }
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
        response = get :submit_hyperlink, params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to eq 'You or your teammate(s) have already submitted the same hyperlink.'
      end
      it 'flashes error if url is invalid' do
        allow(team).to receive(:hyperlinks).and_return([])
        params = {submission: "abc123", id: 21}
        response = get :submit_hyperlink, params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to be_present # not checking message content since it uses #{$ERROR_INFO}
      end
    end
  end
  describe '#remove_hyperlink' do
    #placeholder
  end
  describe '#submit_file' do
    context 'current user does not match up with the participant' do
      it 'renders edit template' do
        allow(AssignmentParticipant).to receive(:find).and_return(participant)
        stub_current_user(instructor1, instructor1.role.name, instructor1.role)
        params = {id: 1}
        response = get :submit_file, params 
        expect(response).to redirect_to(action: :edit, id: 1)
      end
    end
    context 'user that is participant uploads a file' do
      before(:each) do
        allow(AssignmentParticipant).to receive(:find).and_return(participant)
        stub_current_user(student1, student1.role.name, student1.role)
      end
      it 'flashes error for file exceeding size limit' do
        params = {uploaded_file: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/the-rspec-book_p2_1.pdf"),
                  id: 1}
        response = get :submit_file, params
        expect(response).to redirect_to(action: :edit, id: 1)
        expect(flash[:error]).to be_present # not checking message content since it uses variable size limit
      end
      it 'flashes error for file of unexpected type' do
        params = {uploaded_file: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/helloworld.c"),
                  id: 1}
        response = get :submit_file, params
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
        # TODO - create a file for test
      end
      it 'delete action deletes selected files'
      it 'rename action renames selected file'
      it 'move action moves selected file'
      it 'copy action copies selected file'
      it 'create folder action creates new directory'
    end
  end
  describe '#download' do

  end
end