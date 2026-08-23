// Shared defaults and people. The page fields override these for a session.
// Query params also override: ?person=geethan&layout=split&logo=https://...&meeting=https://...
window.SIGNATURE_CONFIG = {
  defaults: {
    websiteUrl: "https://42hz.ai",
    websiteLabel: "42hz.ai",
    logoUrl: "https://42hz.ai/assets/logo-42hz.png",
    logoWidth: 120,
    logoHeight: 40
  },
  people: [
    {
      id: "tim",
      name: "Tim Sabat",
      title: "Co-Founder / CTO",
      email: "tim@42hz.ai",
      meetingUrl: "https://scheduler.zoom.us/timothy-sabat/30m"
    },
    {
      id: "geethan",
      name: "Geethan Nava",
      title: "Co-Founder / Partnerships",
      email: "geethan@42hz.ai",
      meetingUrl: ""
    }
  ]
};
