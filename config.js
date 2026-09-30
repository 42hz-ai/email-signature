// Shared defaults and people. The page fields override these for a session.
// Query params also override: ?person=geethan&layout=split&logo=https://...&meeting=https://...
window.SIGNATURE_CONFIG = {
  // Matches https://42hz.ai/images/logo-42hz-blue.png
  brand: {
    blue: "#3b6acb",
    gold: "#eeb94a",
    ink: "#0b0f14",
    blueSoft: "#eef3fb",
    goldSoft: "#fff8e8",
    muted: "#5a6472"
  },
  defaults: {
    websiteUrl: "https://42hz.ai",
    websiteLabel: "42hz.ai",
    logoUrl: "https://42hz.ai/images/logo-42hz-blue.png",
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
