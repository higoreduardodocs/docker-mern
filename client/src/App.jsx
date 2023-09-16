import { useEffect, useState } from 'react'

import api from './utils/api'
import PostCard from './components/post-card'

export default function App() {
  const [posts, setPosts] = useState([])
  const getPosts = async () => {
    const { data } = await api.get('/posts')
    setPosts(data?.data)
  }
  useEffect(() => {
    getPosts()
  }, [])

  return (
    <main>
      <section className="post-grid">
        {
          !posts?.length ? (
            <h2 className="post-empty">Nenhum post encontrado</h2>
          ) : (
            posts.map((item) => (
              <PostCard key={item._id} title={item.title} description={item.body} />
            ))
          )
        }
      </section>
    </main>
  )
}
