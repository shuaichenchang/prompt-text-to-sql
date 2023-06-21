import GPT3Tokenizer from 'gpt3-tokenizer'

const tokenizer = new GPT3Tokenizer.default({ type: 'codex' })


const str = process.argv[2];
const encoded = tokenizer.encode(str);
const decoded = tokenizer.decode(encoded.bpe);

console.log(encoded["text"].length);
// console.log(decoded);