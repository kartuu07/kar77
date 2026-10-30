const fs = require('fs');
const html = fs.readFileSync('C:\\Users\\kartv\\Downloads\\websitemakes\\guns_page.html', 'utf8');

const pos = html.indexOf('"username":"vishwa_31"');
const slice = html.substring(pos - 30, pos + 2500);
// clean escapes
const clean = slice.replace(/\\"/g, '"').replace(/\\\\/g, '\\');
fs.writeFileSync('C:\\Users\\kartv\\Downloads\\websitemakes\\vishwa_profile.json', clean);
console.log(clean);
