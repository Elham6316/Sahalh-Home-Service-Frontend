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

document.getElementById('request').addEventListener('submit', function(e) {
    e.preventDefault();  // منع إعادة تحميل الصفحة

    const formData = new FormData(this);  // جمع بيانات النموذج

    // إرسال البيانات إلى PHP باستخدام fetch
    fetch('submit_request.html', {
      method: 'POST',
      body: formData
    })
    .then(response => response.text())  // تحويل الاستجابة إلى نص
    .then(data => {
      const modalMessage = document.getElementById('modalMessage');
      
      // إذا كانت الاستجابة تحتوي على كلمة "success" أو "error"، نعرضها
      if (data.includes('تم إرسال الطلب بنجاح')) {
        modalMessage.innerHTML = `<strong>تم!</strong> ${data}`;
      } else {
        modalMessage.innerHTML = `<strong>خطأ!</strong> ${data}`;
      }

      // عرض الـ Modal
      const myModal = new bootstrap.Modal(document.getElementById('responseModal'));
      myModal.show();
    })
    .catch(error => {
      // في حالة حدوث خطأ أثناء الاتصال
      const modalMessage = document.getElementById('modalMessage');
      modalMessage.innerHTML = `<strong>خطأ!</strong> حدث خطأ أثناء إرسال البيانات.`;
      const myModal = new bootstrap.Modal(document.getElementById('responseModal'));
      myModal.show();
    });
});


// register.html

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
    
