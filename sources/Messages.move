module Messages::Messages {
    use std::signer;

    /// Структура для зберігання повідомлення
    struct Message has key {
        text: vector<u8>,
    }

    /// Ініціалізувати пусте повідомлення
    public entry fun init(account: &signer) {
        move_to(account, Message { text: b"" });
    }

    /// Зберегти нове повідомлення
    public entry fun set_message(account: &signer, new_text: vector<u8>) acquires Message {
        let msg = borrow_global_mut<Message>(signer::address_of(account));
        msg.text = new_text;
    }

    /// Отримати повідомлення
    public fun get_message(account: &signer): vector<u8> acquires Message {
        borrow_global<Message>(signer::address_of(account)).text
    }

    /// Видалити повідомлення
    public entry fun clear(account: &signer) acquires Message {
        let msg = borrow_global_mut<Message>(signer::address_of(account));
        msg.text = b"";
    }
}
