// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const path = require('path');
const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: '行为模拟论 · Manuscript Hub',
  tagline: 'Single-source publishing for the Behavioral Simulation Theory book',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://zhangxin840.github.io',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/behavioral-simulation-theory/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'zhangxin840',
  projectName: 'behavioral-simulation-theory',
  deploymentBranch: 'gh-pages',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Chinese, you may want
  // to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          path: path.resolve(__dirname, '../manuscript'),
          routeBasePath: '/',
          sidebarPath: require.resolve('./sidebars.js'),
          numberPrefixParser: false,
          beforeDefaultRemarkPlugins: [require('./remark/redirectBookLinks')],
          showLastUpdateTime: true,
          showLastUpdateAuthor: false,
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],


  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // Replace with your project's social card
      image: 'img/docusaurus-social-card.jpg',
      navbar: {
        title: '行为模拟论',
        logo: {
          alt: 'Manuscript Hub Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'manuscriptSidebar',
            position: 'left',
            label: 'Manuscript',
          },
          {
            to: '/front-matter/01-content-overview',
            label: '内容总览',
            position: 'left',
          },
          {
            href: 'https://github.com/zhangxin840/behavioral-simulation-theory',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Book Assets',
            items: [
              {
                label: 'Manuscript Hub',
                to: '/',
              },
              {
                label: '内容总览 Content Overview',
                to: '/front-matter/01-content-overview',
              },
            ],
          },
          {
            title: 'Repository',
            items: [
              {
                label: 'Book Repository',
                href: 'https://github.com/zhangxin840/behavioral-simulation-theory',
              },
              {
                label: 'PCI Project',
                href: 'https://github.com/zhangxin840/pci',
              },
            ],
          },
          {
            title: 'Team',
            items: [
              {
                label: 'Contact Research Editors',
                href: 'mailto:editors@predictive-consumer-insight.example',
              },
            ],
          },
        ],
        copyright: `版权所有 © ${new Date().getFullYear()} Predictive Consumer Insight. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};

module.exports = config;
