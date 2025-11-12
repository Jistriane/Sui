module todolist::todolist {
    use std::string::{Self, String};
    use sui::event;

    // Struct para representar uma tarefa
    public struct Task has key, store {
        id: UID,
        title: String,
        description: String,
        completed: bool,
    }

    // Struct para a lista de tarefas
    public struct TodoList has key {
        id: UID,
        tasks: vector<Task>,
        owner: address,
    }

    // Eventos
    public struct TaskCreated has copy, drop {
        task_id: ID,
        title: String,
    }

    public struct TaskCompleted has copy, drop {
        task_id: ID,
    }

    public struct TaskDeleted has copy, drop {
        task_id: ID,
    }

    // Criar uma nova lista de tarefas
    public entry fun create_list(ctx: &mut TxContext) {
        let todo_list = TodoList {
            id: object::new(ctx),
            tasks: vector::empty<Task>(),
            owner: tx_context::sender(ctx),
        };
        transfer::share_object(todo_list);
    }

    // Adicionar uma nova tarefa
    public entry fun add_task(
        list: &mut TodoList,
        title: String,
        description: String,
        ctx: &mut TxContext
    ) {
        assert!(list.owner == tx_context::sender(ctx), 0);
        
        let task = Task {
            id: object::new(ctx),
            title,
            description,
            completed: false,
        };

        let task_id = object::uid_to_inner(&task.id);
        
        event::emit(TaskCreated {
            task_id,
            title: task.title,
        });

        vector::push_back(&mut list.tasks, task);
    }

    // Marcar tarefa como completa
    public entry fun complete_task(
        list: &mut TodoList,
        task_index: u64,
        ctx: &TxContext
    ) {
        assert!(list.owner == tx_context::sender(ctx), 0);
        assert!(task_index < vector::length(&list.tasks), 1);

        let task = vector::borrow_mut(&mut list.tasks, task_index);
        task.completed = true;

        event::emit(TaskCompleted {
            task_id: object::uid_to_inner(&task.id),
        });
    }

    // Remover uma tarefa
    public entry fun remove_task(
        list: &mut TodoList,
        task_index: u64,
        ctx: &TxContext
    ) {
        assert!(list.owner == tx_context::sender(ctx), 0);
        assert!(task_index < vector::length(&list.tasks), 1);

        let task = vector::remove(&mut list.tasks, task_index);
        
        event::emit(TaskDeleted {
            task_id: object::uid_to_inner(&task.id),
        });

        let Task { id, title: _, description: _, completed: _ } = task;
        object::delete(id);
    }

    // Função para obter o número de tarefas
    public fun get_task_count(list: &TodoList): u64 {
        vector::length(&list.tasks)
    }

    // Verificar se uma tarefa está completa
    public fun is_task_completed(list: &TodoList, task_index: u64): bool {
        assert!(task_index < vector::length(&list.tasks), 1);
        let task = vector::borrow(&list.tasks, task_index);
        task.completed
    }

    #[test_only]
    use sui::test_scenario;

    #[test]
    fun test_create_and_add_task() {
        let owner = @0xA;
        let mut scenario = test_scenario::begin(owner);
        
        // Criar lista
        {
            create_list(test_scenario::ctx(&mut scenario));
        };
        
        // Adicionar tarefa
        test_scenario::next_tx(&mut scenario, owner);
        {
            let mut list = test_scenario::take_shared<TodoList>(&scenario);
            add_task(
                &mut list,
                string::utf8(b"Aprender Move"),
                string::utf8(b"Completar tutoriais de Move na Sui"),
                test_scenario::ctx(&mut scenario)
            );
            
            assert!(get_task_count(&list) == 1, 0);
            assert!(!is_task_completed(&list, 0), 1);
            
            test_scenario::return_shared(list);
        };
        
        test_scenario::end(scenario);
    }

    #[test]
    fun test_complete_task() {
        let owner = @0xA;
        let mut scenario = test_scenario::begin(owner);
        
        // Criar lista e adicionar tarefa
        {
            create_list(test_scenario::ctx(&mut scenario));
        };
        
        test_scenario::next_tx(&mut scenario, owner);
        {
            let mut list = test_scenario::take_shared<TodoList>(&scenario);
            add_task(
                &mut list,
                string::utf8(b"Tarefa de teste"),
                string::utf8(b"Descrição"),
                test_scenario::ctx(&mut scenario)
            );
            test_scenario::return_shared(list);
        };
        
        // Completar tarefa
        test_scenario::next_tx(&mut scenario, owner);
        {
            let mut list = test_scenario::take_shared<TodoList>(&scenario);
            complete_task(&mut list, 0, test_scenario::ctx(&mut scenario));
            
            assert!(is_task_completed(&list, 0), 0);
            
            test_scenario::return_shared(list);
        };
        
        test_scenario::end(scenario);
    }
}
