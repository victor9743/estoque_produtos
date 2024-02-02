import { useEffect } from "react";

function Inicial() {
    const [produtos, useProdutos] = useEffect([]);
    const produtos_all = () => {
        fetch('https://jsonplaceholder.typicode.com/posts')
        .then((r) => r.json())
        .then((r) => setPosts(r));
    }

    return (
        <>
            <h4>Produtos</h4>
            <table className="table table-bordered">
                <thead>
                    <th>#</th>
                    <th>Nome</th>
                </thead>
            </table>
        </>
    )
}

export default Inicial;