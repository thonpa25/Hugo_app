---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false
type: "directory"

# Business Information
business:
  name: ""
  category: ""
  subcategory: ""
  description: ""
  
# Location
address:
  street: ""
  city: ""
  state: ""
  zip: ""
  country: ""
  
# Contact Details
contact:
  phone: ""
  email: ""
  website: ""
  
# Business Hours
hours:
  monday: ""
  tuesday: ""
  wednesday: ""
  thursday: ""
  friday: ""
  saturday: ""
  sunday: ""
  
# Social Media
social:
  facebook: ""
  twitter: ""
  linkedin: ""
  instagram: ""
  youtube: ""
  
# Features & Amenities
features:
  - ""
  
# Tags for Search
tags:
  - ""
  
# Images
images:
  logo: ""
  featured: ""
  gallery:
    - ""
    
# Ratings
ratings:
  average: 0
  count: 0
  
# Status
verified: false
featured: false
active: true

# SEO
seo:
  meta_title: ""
  meta_description: ""
  keywords: []
---

## About {{ .Params.business.name }}

Write a detailed description of the business here.

## Services Offered

- Service 1
- Service 2
- Service 3

## Why Choose Us

Explain what makes this business unique.

## Customer Reviews

> "Customer testimonial here"
> - Customer Name

## Location & Directions

Provide additional location details or landmarks.

## Special Offers

Current promotions or special offers.