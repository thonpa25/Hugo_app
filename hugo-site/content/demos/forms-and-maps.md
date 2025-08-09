---
title: "Forms and Maps Demo"
description: "Demonstration of contact forms, newsletter signup, and Google Maps integration with various configurations."
date: 2024-08-06
draft: false
layout: "single"

# SEO
meta_title: "Contact Forms & Maps Examples - Interactive Demos"
meta_description: "See live examples of Netlify Forms integration, spam protection, and Google Maps embeds in various styles and configurations."
---

# Contact Forms & Google Maps Integration Demo

This page demonstrates various contact forms and Google Maps implementations available on this Hugo site.

## Contact Forms

### Basic Contact Form

{{< contact-form destination="dan@theonlinepart.com" subject="Basic Contact Form Demo" >}}

### Newsletter Signup Form

Here's a simplified form for newsletter subscriptions:

{{< contact-form 
    destination="dan@theonlinepart.com" 
    subject="Newsletter Subscription" 
    name="newsletter-signup"
    success="/demos/newsletter-success/" >}}

### Support Request Form

A more detailed form for technical support requests:

{{< contact-form 
    destination="dan@theonlinepart.com" 
    subject="Technical Support Request" 
    name="support-form"
    recaptcha="true"
    success="/contact/success/" >}}

---

## Google Maps Integration

### Basic Map with Address

{{< google-map address="1600 Amphitheatre Parkway, Mountain View, CA" title="Google Headquarters" >}}
This map shows Google's headquarters in Mountain View, California.
{{< /google-map >}}

### Map with Coordinates and Custom Zoom

{{< google-map lat="40.7589" lng="-73.9851" zoom="17" title="Times Square, NYC" >}}
Times Square in New York City, shown with a close-up zoom level for detailed street view.
{{< /google-map >}}

### Satellite View Map

{{< google-map 
    address="Grand Canyon National Park, Arizona" 
    style="satellite" 
    zoom="12"
    title="Grand Canyon - Satellite View" >}}
Aerial view of the magnificent Grand Canyon National Park.
{{< /google-map >}}

### Interactive Map with Controls

{{< google-map 
    address="Central Park, New York, NY" 
    zoom="15"
    show-controls="true"
    title="Central Park with Map Controls" >}}
Central Park in Manhattan with interactive controls to switch between map views (roadmap, satellite, terrain).
{{< /google-map >}}

### Business Location Map

{{< google-map 
    address="123 Business Street, Your City, ST 12345" 
    zoom="16"
    title="Our Office Location" >}}
**Visit Our Office**

We're located in the heart of the business district with easy access to:
- Public transportation (Metro Green Line)
- Multiple bus routes
- On-site parking garage
- Wheelchair accessible entrance

**Office Hours:**
- Monday - Friday: 9:00 AM - 5:00 PM
- Saturday: 10:00 AM - 2:00 PM
- Sunday: Closed
{{< /google-map >}}

---

## Advanced Form Features

### Multi-step Form Concept

While our contact form is single-page, here's how you could structure multi-step forms:

1. **Step 1: Contact Information** - Name, email, phone
2. **Step 2: Project Details** - Type of inquiry, timeline, budget
3. **Step 3: Message & Preferences** - Detailed message, communication preferences
4. **Step 4: Review & Submit** - Review all information before submission

### Form Validation Features

Our contact forms include:

- **Client-side Validation**: Immediate feedback on form fields
- **Server-side Processing**: Netlify Forms handles all submissions
- **Spam Protection**: Honeypot fields and reCAPTCHA integration
- **Accessibility**: ARIA labels, keyboard navigation, screen reader support
- **Mobile Responsive**: Optimized for all device sizes
- **Success/Error Handling**: Clear feedback and next steps

### Form Security Features

- **Honeypot Fields**: Hidden fields that trap bots
- **reCAPTCHA v2**: Google's CAPTCHA system for advanced bot protection
- **Rate Limiting**: Netlify's built-in spam detection
- **Input Sanitization**: All form data is sanitized before processing
- **HTTPS Only**: All form submissions use encrypted connections

---

## Integration Tips

### For Content Editors

When using these components in CloudCannon:

1. **Contact Forms**: Use the visual editor to insert contact form shortcodes
2. **Google Maps**: Simply add the map shortcode with your desired address
3. **Customization**: All styling and behavior can be customized through parameters

### For Developers

These components are built with:

- **Progressive Enhancement**: Works without JavaScript, enhanced with it
- **Accessibility First**: WCAG 2.1 AA compliance
- **Performance Optimized**: Lazy loading, efficient assets
- **SEO Friendly**: Structured data, proper meta tags
- **Mobile First**: Responsive design principles

### Configuration Options

Customize forms and maps through:

- **Hugo Front Matter**: Page-level configuration
- **Site Parameters**: Global settings in `hugo.toml`
- **Shortcode Parameters**: Individual component settings
- **CSS Custom Properties**: Visual customization

---

## Browser Support

All components support:

- **Modern Browsers**: Chrome, Firefox, Safari, Edge (latest 2 versions)
- **Mobile Browsers**: iOS Safari, Chrome Mobile, Samsung Internet
- **Accessibility Tools**: Screen readers, keyboard navigation
- **JavaScript Disabled**: Graceful degradation with basic functionality

---

## Need Help?

If you need assistance with forms or maps integration:

{{< contact-form 
    destination="dan@theonlinepart.com" 
    subject="Help with Forms/Maps Integration" 
    name="help-request" >}}