# Toshiba Tec Malaysia — Government, State & GLC Brochure

A customer-focused digital brochure for Malaysian government agencies, state bodies, local authorities (PBT), statutory bodies and GLCs.

Prepared by **Shaziq Idham**, Business Development Executive (Government Accounts), Toshiba Tec Malaysia, Johor Bahru Branch.

## Pages
- `index.html`: short, Bahasa Malaysia main page. 5 pain points, agencies served, procurement options, contact
- `katalog.html`: full catalogue (44 products, 25 software solutions) with official brochures

## Images
All product images and most logos are stored in this repo (`images/` and `logos/`), with the original website as a fallback.
To add a new image from another site, add a line to `tools/assets.txt` (`URL|output-path`) and push. GitHub downloads it automatically.

## Visitor statistics
The page counts visits and clicks (WhatsApp, pain points, brochures) with GoatCounter, which uses no cookies.
To see the numbers, create a free account at goatcounter.com with the code `toshibajb`, then open https://toshibajb.goatcounter.com.

## Adding products later (shredder, CCTV, VoIP, etc.)
In `index.html`, add an item to `PROD`, then list its key under the right pain point in `PAINS`. Agencies go in `CLIENTS`.

## What's in the catalogue
- **"What is your office struggling with?"**: 8 common public-sector challenges, each showing the problem, the outcome, and recommended products and software
- **Printer sizing guide**: Compact / Standard / Enterprise by office size
- **Full catalogue**: 44 products with filters, search, official brochure PDFs and spec links
- **25 software & service solutions**: EDMS, scanning, asset tracking, RPA, HRMS and more
- **Enquiry list**: customers add items and send the list by WhatsApp or email in one tap
- How-to-buy steps, FAQ and contact details

## Editing your details
Open `index.html` and edit the `CONFIG` block near the bottom of the file (name, phone, WhatsApp number, email, branch, MOF number).

## Viewing
Open `index.html` in any web browser with internet access. Product images and brochure PDFs load from toshibatec.com.my.

To share it as a website, turn on **GitHub Pages** (Settings → Pages → Deploy from branch → `main` / root). Note that GitHub Pages sites are public even when the repository is private, and this page shows your mobile number and MOF number.
