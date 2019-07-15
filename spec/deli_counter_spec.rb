describe 'Deli Counter' do

  let(:katz_deli) { [] }
  let(:other_deli) { ["Logan", "Avi", "Spencer"] }
  let(:another_deli) { ["Amanda", "Annette", "Ruchi", "Jason", "Logan", "Spencer", "Avi", "Joe", "Rachel", "Lindsey"] }

  describe "#line" do
    context "there is nobody in line" do
      it "should say the line is empty" do
        # This line checks the current standard output (your terminal screen)
        # to make sure the correct output has been puts'ed.
        expect($stdout).to receive(:puts).with("The line is currently empty.")
        line(katz_deli)
      end

end
    context "there are people in line" do
      it "should display the current line" do
        expect($stdout).to receive(:puts).with("The line is currently: 1. Logan 2. Avi 3. Spencer")
        line(other_deli)
      end

      it 'works with different people in line' do
	      expect($stdout).to receive(:puts).with("The line is currently: 1. Amanda 2. Annette 3. Ruchi 4. Jason 5. Logan 6. Spencer 7. Avi 8. Joe 9. Rachel 10. Lindsey")
	line(another_deli)
      end
    end
<<<<<<< HEAD
   def line(katz_deli)
        if (katz_deli.length <1)
         puts "The line is currently empty."
        else 
          listNames = "The line is currently: "
          katz_deli.each_with_index do |name,index|
            if (index === katz_deli.length-1)
              listNames = listNames + (index+1).to_s + ". " + name 
            else
            listNames = listNames + (index+1).to_s + ". " + name +" "
            end
          end
          puts listNames
=======
        def line(katz_deli)
        if (katz_deli.length <1)
         puts "The line is currently empty."
        else 
          listNames = ""
          katz_deli.each_with_index do |name,index|
          listNames = listNames + index.to_s + "." + name +", "
          
          end
          return listNames
>>>>>>> 59954d9bf20fc8f9ea7c854529fea23fe4736454
        end
    end
  end

  describe "#take_a_number" do
    context "there is nobody in line" do
      it "should add a person to the line" do
        expect($stdout).to receive(:puts).with("Welcome, Ada. You are number 1 in line.")
        take_a_number(katz_deli, "Ada")
        expect(katz_deli).to eq(["Ada"])
      end
    end

    context "there are already people in line" do
      it "should add a person to the end of the line" do
        # This weird looking %w syntax is just another way to instantiate an
        # Array. %w(item1 item2) is equivalent to ["item1", "item2"]
        expect($stdout).to receive(:puts).with("Welcome, Grace. You are number 4 in line.")
        take_a_number(other_deli, "Grace")
        expect(other_deli).to eq(%w(Logan Avi Spencer Grace))
      end
      
    end

    context "adding multiple people in a row" do
      it "should correctly build the line" do
        take_a_number(katz_deli, "Ada")
        take_a_number(katz_deli, "Grace")
        take_a_number(katz_deli, "Kent")
        expect(katz_deli).to eq(%w(Ada Grace Kent))
      end
    end
    def take_a_number(katz_deli,name)
      if(katz_deli.length<1)
        katz_deli.push(name)
        puts "Welcome, #{name}. You are number 1 in line."
      else
        katz_deli.push(name)
        puts "Welcome, #{name}. You are number #{katz_deli.length} in line."
        return katz_deli
      end
    end
  end

  describe "#now_serving" do
    context "there are no people in line" do
      it "should say that the line is empty" do
        expect($stdout).to receive(:puts).with("There is nobody waiting to be served!")
        now_serving(katz_deli)
      end
    end

    context "there are people in line" do
      it "should serve the first person in line and remove them from the queue" do
        expect($stdout).to receive(:puts).with("Currently serving Logan.")
        now_serving(other_deli)
        expect(other_deli).to eq(%w(Avi Spencer))
      end
    end
    
    def now_serving(katz_deli)
      if(katz_deli.length<1)
        puts "There is nobody waiting to be served!"
      else
        puts "Currently serving " + katz_deli[0] + "."
        katz_deli.shift
      end
      return katz_deli
    end
  end

end
