# Setting up react dev environment with vite and tailwind css installed
# Run this script by 'source npm_setup.sh'

echo 'Running vite-react-tailwindcss setup'
echo 'input project name'
read project_name
npm create vite@latest $project_name -- --template react

echo '===== Navigate to project folder ======'
cd $project_name
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

config_file_path='tailwind.config.js'

cat <<EOF > ${config_file_path}
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

css_path='src/index.css'

cat << EOF > ${css_path}
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

