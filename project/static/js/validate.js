function validateForm() {
		var name = document.forms["form1"]["name"].value;
		var phone = document.forms["form1"]["phone"].value;
		var email = document.forms["form1"]["email"].value;
		var snumber=document.forms["form1"]["number"].value
		var sname=document.forms["form1"]["sname"].value
		var subrub=document.forms["form1"]["subrub"].value
		var postcode=document.forms["form1"]["postcode"].value

		var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

 		 if(name==''){
			alert('Please enter your name.');
			return false;
		}else if(phone==''){
			alert('Please enter your phone number.');
			return false;
		}else if(email==''){
			alert('Please enter your email.');
			return false;
		}else if(snumber==''){
			alert('Please enter your street name.');
			return false;
		}else if (reg.test(email) == false) {
           		 alert('Invalid Email Address');
            		return false;
        }else if(sname==''){
			alert('Please enter your street name.');
			return false;
		}else if(subrub==''){
			alert('Please enter your subrub.');
			return false;
		}else if(postcode==''){
			alert('Please enter your postcode.');
			return false;
		}else if(phone.length!=10 and phone.match(/^[0-9]+$/) != null){
			alert('Please enter a valid phone number');
			return false;
			}




	}