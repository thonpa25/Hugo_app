---
title: "Contact Us"
description: "Get in touch with us. We'd love to hear from you and answer any questions you may have."
date: 2024-08-06
draft: false
layout: "contact"

# Page SEO
meta_title: "Contact Us - Get in Touch Today"
meta_description: "Contact us for inquiries, support, or partnerships. We respond within 24 hours during business days."
canonical_url: "/contact/"

# Contact form configuration
contact_form:
  enabled: true
  destination: "dan@theonlinepart.com"
  subject: "Website Contact Form Submission"
  recaptcha_enabled: true
  honeypot_enabled: true
  success_url: "/contact/success/"

# Contact information
contact_info:
  email: "info@yourbusiness.com"
  phone: "+1 (555) 123-4567"
  address: |
    123 Business Street
    Suite 100
    Your City, ST 12345
    United States
  hours: |
    Monday - Friday: 9:00 AM - 5:00 PM EST
    Saturday: 10:00 AM - 2:00 PM EST
    Sunday: Closed

# Map configuration
map:
  enabled: true
  address: "123 Business Street, Your City, ST 12345"
  zoom: "15"
  style: "default"
  show_controls: true

# Social media links
social_media:
  - name: "LinkedIn"
    icon: "fab fa-linkedin"
    url: "https://linkedin.com/company/yourcompany"
  - name: "Twitter"
    icon: "fab fa-twitter"
    url: "https://twitter.com/yourcompany"
  - name: "Facebook"
    icon: "fab fa-facebook"
    url: "https://facebook.com/yourcompany"
---

## Get In Touch

We're here to help and answer any question you might have. We look forward to hearing from you! Whether you have a question about features, pricing, need a demo, or anything else, our team is ready to answer all your questions.

### Quick Contact Options

<div class="row mb-5">
  <div class="col-md-4 mb-3">
    <div class="contact-method text-center p-4 h-100 border rounded">
      <i class="fas fa-envelope fa-3x text-primary mb-3"></i>
      <h4>Email Us</h4>
      <p class="text-muted">For general inquiries and detailed questions</p>
      <a href="mailto:{{ .Params.contact_info.email }}" class="btn btn-outline-primary">
        {{ .Params.contact_info.email }}
      </a>
    </div>
  </div>
  
  <div class="col-md-4 mb-3">
    <div class="contact-method text-center p-4 h-100 border rounded">
      <i class="fas fa-phone fa-3x text-primary mb-3"></i>
      <h4>Call Us</h4>
      <p class="text-muted">For urgent matters and direct support</p>
      <a href="tel:{{ .Params.contact_info.phone }}" class="btn btn-outline-primary">
        {{ .Params.contact_info.phone }}
      </a>
    </div>
  </div>
  
  <div class="col-md-4 mb-3">
    <div class="contact-method text-center p-4 h-100 border rounded">
      <i class="fas fa-clock fa-3x text-primary mb-3"></i>
      <h4>Business Hours</h4>
      <p class="text-muted">When you can reach us directly</p>
      <div class="small">
        {{ .Params.contact_info.hours | markdownify }}
      </div>
    </div>
  </div>
</div>

### Send Us a Message

{{< contact-form destination="dan@theonlinepart.com" subject="Contact Form - Website Inquiry" recaptcha="true" >}}

### Find Us

{{ if .Params.map.enabled }}
<div class="row mt-5">
  <div class="col-md-8">
    {{< google-map address=.Params.map.address zoom=.Params.map.zoom style=.Params.map.style show-controls=.Params.map.show_controls >}}
    Visit us at our office located in the heart of the business district. We're easily accessible by public transportation and have parking available.
    {{< /google-map >}}
  </div>
  
  <div class="col-md-4">
    <div class="office-info p-4 bg-light rounded h-100">
      <h4><i class="fas fa-map-marker-alt me-2 text-primary"></i>Office Address</h4>
      <address class="mb-4">
        {{ .Params.contact_info.address | markdownify }}
      </address>
      
      <h5><i class="fas fa-directions me-2 text-primary"></i>Getting Here</h5>
      <ul class="list-unstyled small">
        <li class="mb-2"><i class="fas fa-subway me-2 text-muted"></i>Metro: Green Line to Business Station</li>
        <li class="mb-2"><i class="fas fa-bus me-2 text-muted"></i>Bus: Routes 12, 34, 56</li>
        <li class="mb-2"><i class="fas fa-car me-2 text-muted"></i>Parking: Available in building garage</li>
        <li class="mb-2"><i class="fas fa-wheelchair me-2 text-muted"></i>Accessible entrance on main floor</li>
      </ul>
      
      <a href="https://www.google.com/maps/search/{{ .Params.map.address | urlquery }}" 
         target="_blank" 
         class="btn btn-primary btn-sm">
        <i class="fas fa-external-link-alt me-1"></i>
        Open in Google Maps
      </a>
    </div>
  </div>
</div>
{{ end }}

### Connect With Us

<div class="row mt-5">
  <div class="col-12">
    <div class="text-center p-4 bg-light rounded">
      <h4 class="mb-3">Follow Us on Social Media</h4>
      <p class="text-muted mb-4">Stay updated with our latest news and updates</p>
      
      <div class="social-links">
        {{ range .Params.social_media }}
        <a href="{{ .url }}" 
           target="_blank" 
           rel="noopener noreferrer"
           class="btn btn-outline-primary me-3 mb-2"
           aria-label="{{ .name }}">
          <i class="{{ .icon }} me-2"></i>{{ .name }}
        </a>
        {{ end }}
      </div>
    </div>
  </div>
</div>

### Frequently Asked Questions

<div class="accordion mt-5" id="contactFAQ">
  <div class="accordion-item">
    <h2 class="accordion-header" id="faq1">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
        How quickly do you respond to inquiries?
      </button>
    </h2>
    <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="faq1" data-bs-parent="#contactFAQ">
      <div class="accordion-body">
        We typically respond to all inquiries within 24 hours during business days (Monday-Friday). For urgent matters, please call us directly during business hours for immediate assistance.
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="faq2">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
        What information should I include in my message?
      </button>
    </h2>
    <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="faq2" data-bs-parent="#contactFAQ">
      <div class="accordion-body">
        Please provide as much detail as possible about your inquiry, including your timeline, budget (if applicable), and any specific requirements. This helps us provide you with the most accurate and helpful response.
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="faq3">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
        Do you offer consultations?
      </button>
    </h2>
    <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="faq3" data-bs-parent="#contactFAQ">
      <div class="accordion-body">
        Yes! We offer free initial consultations to discuss your needs and how we can help. You can schedule a consultation by filling out our contact form or calling us directly.
      </div>
    </div>
  </div>
</div>