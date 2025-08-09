/**
 * Simple Site JavaScript
 * Performance-optimized for Hugo site shell
 */

(function() {
  'use strict';
  
  // Performance: Use passive event listeners
  const supportsPassive = (() => {
    let passiveSupported = false;
    try {
      const options = {
        get passive() {
          passiveSupported = true;
          return false;
        }
      };
      window.addEventListener('test', null, options);
      window.removeEventListener('test', null, options);
    } catch(err) {}
    return passiveSupported;
  })();
  
  const passive = supportsPassive ? { passive: true } : false;
  
  // Initialize when DOM is ready
  function ready(fn) {
    if (document.readyState !== 'loading') {
      fn();
    } else {
      document.addEventListener('DOMContentLoaded', fn);
    }
  }
  
  ready(function() {
    
    // Mobile menu toggle with accessibility
    const menuToggle = document.querySelector('.menu-toggle');
    const mobileMenu = document.querySelector('.mobile-menu');
    const menuOverlay = document.querySelector('.menu-overlay');
    
    if (menuToggle && mobileMenu) {
        menuToggle.addEventListener('click', function() {
            const isOpen = mobileMenu.classList.contains('active');
            mobileMenu.classList.toggle('active');
            if (menuOverlay) menuOverlay.classList.toggle('active');
            
            // Accessibility: Update ARIA attributes
            menuToggle.setAttribute('aria-expanded', !isOpen);
            mobileMenu.setAttribute('aria-hidden', isOpen);
            
            // Trap focus in mobile menu when open
            if (!isOpen) {
                mobileMenu.querySelector('a, button')?.focus();
            }
        });
        
        // Close menu on overlay click
        if (menuOverlay) {
            menuOverlay.addEventListener('click', function() {
                mobileMenu.classList.remove('active');
                menuOverlay.classList.remove('active');
                menuToggle.setAttribute('aria-expanded', 'false');
                mobileMenu.setAttribute('aria-hidden', 'true');
            });
        }
        
        // Close menu on Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && mobileMenu.classList.contains('active')) {
                mobileMenu.classList.remove('active');
                if (menuOverlay) menuOverlay.classList.remove('active');
                menuToggle.setAttribute('aria-expanded', 'false');
                mobileMenu.setAttribute('aria-hidden', 'true');
                menuToggle.focus();
            }
        });
    }
    
    // Smooth scroll for anchor links with performance optimization
    const smoothScrollLinks = document.querySelectorAll('a[href^="#"]');
    if (smoothScrollLinks.length > 0 && 'scrollBehavior' in document.documentElement.style) {
        smoothScrollLinks.forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href === '#') return;
                
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    // Update URL without triggering scroll
                    history.pushState(null, null, href);
                    
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                    
                    // Accessibility: Move focus to target
                    target.setAttribute('tabindex', '-1');
                    target.focus();
                }
            }, passive);
        });
    }
    
    // Enhanced form validation with better UX
    const forms = document.querySelectorAll('form[data-netlify="true"]');
    forms.forEach(form => {
        // Add loading state handler
        form.addEventListener('submit', function(e) {
            let hasErrors = false;
            
            // Clear previous errors
            form.querySelectorAll('.error-message').forEach(el => el.remove());
            form.querySelectorAll('.error').forEach(el => el.classList.remove('error'));
            
            // Validate email
            const email = form.querySelector('input[type="email"]');
            if (email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email.value)) {
                    e.preventDefault();
                    hasErrors = true;
                    email.classList.add('error');
                    const error = document.createElement('div');
                    error.className = 'error-message';
                    error.textContent = 'Please enter a valid email address';
                    email.parentNode.insertBefore(error, email.nextSibling);
                }
            }
            
            // Validate message
            const message = form.querySelector('textarea[name="message"]');
            if (message && message.value.trim().length < 10) {
                e.preventDefault();
                hasErrors = true;
                message.classList.add('error');
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Message must be at least 10 characters';
                message.parentNode.insertBefore(error, message.nextSibling);
            }
            
            // Validate required fields
            form.querySelectorAll('[required]').forEach(field => {
                if (!field.value.trim()) {
                    e.preventDefault();
                    hasErrors = true;
                    field.classList.add('error');
                    if (!field.nextSibling || !field.nextSibling.classList?.contains('error-message')) {
                        const error = document.createElement('div');
                        error.className = 'error-message';
                        error.textContent = 'This field is required';
                        field.parentNode.insertBefore(error, field.nextSibling);
                    }
                }
            });
            
            // If no errors, add loading state
            if (!hasErrors) {
                const submitBtn = form.querySelector('button[type="submit"]');
                if (submitBtn) {
                    submitBtn.classList.add('loading');
                    submitBtn.disabled = true;
                    submitBtn.textContent = 'Sending...';
                }
            }
        });
        
        // Real-time validation feedback
        form.querySelectorAll('input, textarea').forEach(field => {
            field.addEventListener('blur', function() {
                // Remove error on valid input
                if (this.value.trim()) {
                    this.classList.remove('error');
                    const error = this.nextSibling;
                    if (error && error.classList?.contains('error-message')) {
                        error.remove();
                    }
                }
            });
        });
    });
    
    // Performance monitoring
    if (window.performance && performance.mark) {
        performance.mark('interactive');
    }
  });
  
  // Enhanced lazy loading with native loading support
  function lazyLoadImages() {
    // Check for native lazy loading support
    if ('loading' in HTMLImageElement.prototype) {
        const images = document.querySelectorAll('img[data-src]');
        images.forEach(img => {
            img.src = img.dataset.src;
            img.removeAttribute('data-src');
            if (img.dataset.srcset) {
                img.srcset = img.dataset.srcset;
                img.removeAttribute('data-srcset');
            }
        });
    } else if ('IntersectionObserver' in window) {
        // Fallback to Intersection Observer
        const images = document.querySelectorAll('img[data-src]');
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.dataset.src;
                    img.removeAttribute('data-src');
                    if (img.dataset.srcset) {
                        img.srcset = img.dataset.srcset;
                        img.removeAttribute('data-srcset');
                    }
                    img.classList.add('loaded');
                    observer.unobserve(img);
                }
            });
        }, {
            rootMargin: '50px 0px',
            threshold: 0.01
        });
        
        images.forEach(img => imageObserver.observe(img));
    } else {
        // Fallback for older browsers
        const images = document.querySelectorAll('img[data-src]');
        images.forEach(img => {
            img.src = img.dataset.src;
            img.removeAttribute('data-src');
        });
    }
  }
  
  // Initialize lazy loading
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', lazyLoadImages);
  } else {
    lazyLoadImages();
  }
  
  // Prefetch links on hover for faster navigation
  function enableLinkPrefetch() {
    if (!('IntersectionObserver' in window)) return;
    
    const prefetched = new Set();
    
    document.addEventListener('mouseover', function(e) {
        const link = e.target.closest('a');
        if (!link) return;
        
        const href = link.href;
        if (!href || href === '#' || prefetched.has(href)) return;
        if (!href.startsWith(window.location.origin)) return;
        
        const prefetchLink = document.createElement('link');
        prefetchLink.rel = 'prefetch';
        prefetchLink.href = href;
        document.head.appendChild(prefetchLink);
        prefetched.add(href);
    }, passive);
  }
  
  enableLinkPrefetch();
  
})();