  function displayPrice() {
    const serviceType = document.getElementById("problem").value;
    let price = 0;
    
    // Set prices based on service type
    const prices = {
        "1": 300,  // الكهرباء
        "2": 200,  // السباكة
        "3": 350,
        "4":250,
        "5":150,
        "6":100,
        "7":400,
        "8": 350, // تكييف وتبريد
        // Add prices for other services
    };
    
    if (prices[serviceType]) {
        price = prices[serviceType];
    }
    
    // Update hidden field and display
    document.getElementById("price-text").innerText = `السعر: ${price} ريال`;
}

    // Toggle password visibility
    function togglePassword(inputId) {
      const passwordInput = document.getElementById(inputId);
      const toggleIcon = passwordInput.nextElementSibling.querySelector('i');
      
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        toggleIcon.classList.remove('fa-eye');
        toggleIcon.classList.add('fa-eye-slash');
      } else {
        passwordInput.type = 'password';
        toggleIcon.classList.remove('fa-eye-slash');
        toggleIcon.classList.add('fa-eye');
      }
    }

function clientlogin(event) {
  event.preventDefault(); // تمنع الفورم من إعادة تحميل الصفحة

  var email = document.getElementById("email").value;
  var password = document.getElementById("login-password").value;

  if (email === "example@example.com" && password === "123456") {
    window.location.href = "client.html";
  } else {
    alert("البريد الإلكتروني أو كلمة المرور غير صحيحة.");
  }
}


