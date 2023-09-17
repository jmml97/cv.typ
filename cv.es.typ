#import "cv.typ": *

// Load CV data from YAML
#let cvdata = yaml("cv.es.yml")

#let uservars = (
  lang: "es",
  headingfont: "U001", // Set font for headings
  bodyfont: "U001", // Set font for body
  fontsize: 12pt, // 10pt, 11pt, 12pt
  linespacing: 8pt,
  showAddress: false, // true/false Show address in contact info
  showNumber: false, // true/false Show phone number in contact info
)

#let customrules(doc) = {
  // Add custom document style rules here
  doc
}

#let cvinit(doc) = {
  doc = setrules(uservars, doc)
  doc = showrules(uservars, doc)
  doc = customrules(doc)

  doc
}

// Each section function can be overridden by re-declaring it here
// #let cveducation = []

// Content
#show: doc => cvinit(doc)

#let strings = setstrings(uservars)

#cvheading(cvdata, uservars)

#cvwork(cvdata, strings)
#cveducation(cvdata, strings)
#cvaffiliations(cvdata, strings)
#cvprojects(cvdata, strings)
#cvskills(cvdata, strings)

#endnote(strings)
