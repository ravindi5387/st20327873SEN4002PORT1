// Common JavaScript functions

// Admin credentials
const ADMIN_EMAIL = "admin123@gmail.com";
const ADMIN_PASSWORD = "admin123";

// Notification system
function showNotification(message, type = "info") {
  const notificationContainer = document.getElementById("notification-container");
  if (!notificationContainer) return;
  
  const notification = document.createElement("div");
  notification.className = `notification ${type}`;
  notification.innerHTML = `
          <div>${message}</div>
          <div class="close-notification">&times;</div>
      `;

  notificationContainer.appendChild(notification);

  // Auto remove after 5 seconds
  setTimeout(() => {
    notification.remove();
  }, 5000);

  // Close on click
  notification
    .querySelector(".close-notification")
    .addEventListener("click", () => {
      notification.remove();
    });
}

// Format currency in Sri Lankan Rupees
function formatCurrency(amount) {
  return (
    "Rs " +
    parseFloat(amount).toLocaleString("en-LK", {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })
  );
}

// Set default date to today (2025)
function setDefaultDate() {
  const today = new Date();
  today.setFullYear(2025); // Set year to 2025
  return today.toISOString().split("T")[0];
}

// Initialize notification system
function initNotificationSystem() {
  const notificationContainer = document.createElement("div");
  notificationContainer.id = "notification-container";
  document.body.prepend(notificationContainer);
}

// Initialize modal functionality
function initModal() {
  const deleteModal = document.getElementById("delete-modal");
  if (!deleteModal) return;
  
  const closeModal = document.querySelector(".close");
  const cancelDelete = document.getElementById("cancel-delete");
  const confirmDelete = document.getElementById("confirm-delete");

  if (closeModal) {
    closeModal.addEventListener("click", function () {
      deleteModal.style.display = "none";
    });
  }

  if (cancelDelete) {
    cancelDelete.addEventListener("click", function () {
      deleteModal.style.display = "none";
    });
  }

  if (confirmDelete) {
    confirmDelete.addEventListener("click", function () {
      if (window.currentDeleteType === "transaction") {
        deleteTransaction(window.currentDeleteId, window.currentDeleteIndex);
      } else if (window.currentDeleteType === "member") {
        deleteFamilyMember(window.currentDeleteId, window.currentDeleteIndex);
      }
      deleteModal.style.display = "none";
    });
  }

  // Close modal when clicking outside
  window.addEventListener("click", function (event) {
    if (event.target === deleteModal) {
      deleteModal.style.display = "none";
    }
  });
}

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
  initNotificationSystem();
  initModal();
  
  // Set active navigation based on current page
  const currentPage = window.location.pathname.split('/').pop();
  const navLinks = document.querySelectorAll('.nav-link');
  
  navLinks.forEach(link => {
    if (link.getAttribute('href') === currentPage) {
      link.classList.add('active');
    } else {
      link.classList.remove('active');
    }
  });
});