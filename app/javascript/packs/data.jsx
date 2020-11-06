import React from 'react'
import { FaBehance, FaFacebook, FaLinkedin, FaTwitter } from 'react-icons/fa'
export const links = [
  {
    id: 1,
    url: '/',
    text: '覗いてみる',
  },
  {
    id: 2,
    url: '/users/sign_in',
    text: 'ログイン',
  },
  {
    id: 3,
    url: '/users/sign_up',
    text: '新規登録',
  },
]

export const social = [
  {
    id: 1,
    url: 'https://www.twitter.com',
    icon: <FaFacebook />,
  },
  {
    id: 2,
    url: 'https://www.twitter.com',
    icon: <FaTwitter />,
  },
  {
    id: 3,
    url: 'https://www.twitter.com',
    icon: <FaLinkedin />,
  },
  {
    id: 4,
    url: 'https://www.twitter.com',
    icon: <FaBehance />,
  },
]
